From: User Name <us53rnam3@gmail.com>
Date: Thu, 6 Aug 2020 08:53:54 -0400
Subject: [Buildroot] I need help to solve this error.
In-Reply-To: <df54940149129e4a0c7e7661497c2662@umbiko.net>
References: <mailman.13.1596628803.136533.buildroot@busybox.net>
 <df54940149129e4a0c7e7661497c2662@umbiko.net>
Message-ID: <CA+NfSnLwCAfAkObYVhHDERk_k06D7w=5dM5b44cQuX9zSa4GHw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok, thanks. Im still trying to repain some issues. jemwarodrierk at debian:~$
cd
/home/jemwarodrierk/Bureau/buildroot/toolchain/toolchain/bin/armv7-eabihf--glibc--bleeding-edge-2020.02-2/bin/linux_vita
jemwarodrierk at debian:~/Bureau/buildroot/toolchain/toolchain/bin/armv7-eabihf--glibc--bleeding-edge-2020.02-2/bin/linux_vita$
export
PATH=$PATH:/home/jemwarodrierk/Bureau/buildroot/toolchain/toolchain/bin/armv7-eabihf--glibc--bleeding-edge-2020.02-2/binjemwarodrierk at debian:~/Bureau/buildroot/toolchain/toolchain/bin/armv7-eabihf--glibc--bleeding-edge-2020.02-2/bin/linux_vita$
make ARCH=arm CROSS_COMPILE=arm-linux- -j
scripts/kconfig/conf  --syncconfig Kconfig
*
* Restart config...
*
*
* Kernel Features
*
Symmetric Multi-Processing (SMP) [Y/n/?] y
  Allow booting SMP kernel on uniprocessor systems (SMP_ON_UP) [N/y/?] n
  Support cpu topology definition (ARM_CPU_TOPOLOGY) [Y/n/?] y
    Multi-core scheduler support (SCHED_MC) [N/y/?] n
    SMT scheduler support (SCHED_SMT) [N/y/?] n
Architected timer support (HAVE_ARM_ARCH_TIMER) [Y/?] y
Multi-Cluster Power Management (MCPM) [N/y/?] n
big.LITTLE support (Experimental) (BIG_LITTLE) [N/y/?] n
Memory split
> 1. 3G/1G user/kernel split (VMSPLIT_3G)
  2. 3G/1G user/kernel split (for full 1G low memory) (VMSPLIT_3G_OPT)
  3. 2G/2G user/kernel split (VMSPLIT_2G)
  4. 1G/3G user/kernel split (VMSPLIT_1G)
choice[1-4?]: 1
Maximum number of CPUs (2-32) (NR_CPUS) [4] 4
Support for hot-pluggable CPUs (HOTPLUG_CPU) [Y/?] y
Support for the ARM Power State Coordination Interface (PSCI) (ARM_PSCI)
[N/y/?] n
Timer frequency
> 1. 100 Hz (HZ_100)
  2. 200 Hz (HZ_200)
  3. 250 Hz (HZ_250)
  4. 300 Hz (HZ_300)
  5. 500 Hz (HZ_500)
  6. 1000 Hz (HZ_1000)
choice[1-6?]: 1
Compile the kernel in Thumb-2 mode (THUMB2_KERNEL) [N/y/?] n
Runtime patch udiv/sdiv instructions into __aeabi_{u}idiv()
(ARM_PATCH_IDIV) [Y/n/?] y
Use the ARM EABI to compile the kernel (AEABI) [Y/?] y
  Allow old ABI binaries to run with this kernel (EXPERIMENTAL)
(OABI_COMPAT) [N/y/?] n
High Memory Support (HIGHMEM) [N/y/?] n
Enable use of CPU domains to implement privileged no-access
(CPU_SW_DOMAIN_PAN) [Y/n/?] y
Maximum zone order (FORCE_MAX_ZONEORDER) [11] 11
Use kernel mem{cpy,set}() for {copy_to,clear}_user() (UACCESS_WITH_MEMCPY)
[N/y/?] n
Enable seccomp to safely compute untrusted bytecode (SECCOMP) [N/y/?] n
Enable paravirtualization code (PARAVIRT) [N/y/?] n
Paravirtual steal time accounting (PARAVIRT_TIME_ACCOUNTING) [N/y/?] n
Xen guest support on ARM (XEN) [N/y/?] n
Use a unique stack canary value for each task (STACKPROTECTOR_PER_TASK)
[Y/n/?] (NEW) y
*
* GCC plugins
*
GCC plugins (GCC_PLUGINS) [Y/n/?] (NEW) y
  Compute the cyclomatic complexity of a function
(GCC_PLUGIN_CYC_COMPLEXITY) [N/y/?] (NEW) y
  Generate some entropy during boot and runtime (GCC_PLUGIN_LATENT_ENTROPY)
[N/y/?] (NEW) y
  Randomize layout of sensitive kernel structures (GCC_PLUGIN_RANDSTRUCT)
[N/y/?] (NEW) y
    Use cacheline-aware structure randomization
(GCC_PLUGIN_RANDSTRUCT_PERFORMANCE) [N/y/?] (NEW) y
*
* Memory initialization
*
Initialize kernel stack variables at function entry
> 1. no automatic initialization (weakest) (INIT_STACK_NONE)
  2. zero-init structs marked for userspace (weak)
(GCC_PLUGIN_STRUCTLEAK_USER) (NEW)
  3. zero-init structs passed by reference (strong)
(GCC_PLUGIN_STRUCTLEAK_BYREF) (NEW)
  4. zero-init anything passed by reference (very strong)
(GCC_PLUGIN_STRUCTLEAK_BYREF_ALL) (NEW)
choice[1-4?]: 4
Report forcefully initialized variables (GCC_PLUGIN_STRUCTLEAK_VERBOSE)
[N/y/?] (NEW) y
Enable heap memory zeroing on allocation by default
(INIT_ON_ALLOC_DEFAULT_ON) [N/y/?] n
Enable heap memory zeroing on free by default (INIT_ON_FREE_DEFAULT_ON)
[N/y/?] n
y
/bin/sh: 1: cannot create include/generated/uapi/linux/.version.h.tmp:
Permission denied
  UPD     include/generated/uapi/linux/version.h
mv: impossible d'?valuer 'include/generated/uapi/linux/.version.h.tmp':
Aucun fichier ou dossier de ce type
make: *** [Makefile:1162: include/generated/uapi/linux/version.h] Error 1
make: *** Attente des t?ches non termin?es....
jemwarodrierk at debian:~/Bureau/buildroot/toolchain/toolchain/bin/armv7-eabihf--glibc--bleeding-edge-2020.02-2/bin/linux_vita$
y
bash: y : commande introuvable
jemwarodrierk at debian:~/Bureau/buildroot/toolchain/toolchain/bin/armv7-eabihf--glibc--bleeding-edge-2020.02-2/bin/linux_vita$


Le jeu. 6 ao?t 2020, ? 03 h 10, Andreas Ziegler <br015@umbiko.net> a ?crit :

> > Date: Tue, 4 Aug 2020 15:31:17 -0400
> > From: User Name <us53rnam3@gmail.com>
> > To: buildroot at buildroot.org
> > Subject: [Buildroot] I need help to solve this error.
>
> > scripts/Kconfig.include:39: compiler 'arm-linux-gcc' not found
>
> Your external toolchain is not accessible via $PATH.
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200806/df2f31a0/attachment.html>
