From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Aug 2014 23:04:32 +0200
Subject: [Buildroot] Problem building libglib2
In-Reply-To: <1408716816913-77917.post@n4.nabble.com>
References: <CAE21AQqs92x6=x_ELTWz7MqMLNDrq9VDXK17+P_2sB-7wc=JXw@mail.gmail.com>
 <50B68928.4010500@mind.be> <50B72AAB.2020402@mind.be>
 <201211300652.45293.manningc2@actrix.gen.nz>
 <20121129190813.5dc97298@skate>
 <201211300731.53056.manningc2@actrix.gen.nz>
 <50B7C54C.3010103@mind.be> <20121130001154.129b9238@skate>
 <50B87033.7090609@mind.be>
 <201212031142.22665.manningc2@actrix.gen.nz>
 <1408716816913-77917.post@n4.nabble.com>
Message-ID: <20140824230432.171af9ee@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear oscarin,

On Fri, 22 Aug 2014 07:13:36 -0700 (PDT), oscarin wrote:
> I'm having kind of the same problem when building my system. When i tried to
> build "directfb-examples 1.6.0 Building" in "buildroot-2013.08.1" i have
> this messages: 
> 
> /home/oscarin/Downloads/felabs/sysdev/buildroot/buildroot-2013.08.1/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.6.1/../../../../arm-none-linux-gnueabi/bin/ld:
> cannot find /lib/libpthread.so.0
> /home/oscarin/Downloads/felabs/sysdev/buildroot/buildroot-2013.08.1/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.6.1/../../../../arm-none-linux-gnueabi/bin/ld:
> cannot find /usr/lib/libpthread_nonshared.a
> collect2: ld returned 1 exit status
> make[3]: *** [df_knuckles] Error 1
> make[3]: Leaving directory
> `/home/oscarin/Downloads/felabs/sysdev/buildroot/buildroot-2013.08.1/output/build/directfb-examples-1.6.0/src/df_knuckles'
> make[2]: *** [all-recursive] Error 1
> make[2]: Leaving directory
> `/home/oscarin/Downloads/felabs/sysdev/buildroot/buildroot-2013.08.1/output/build/directfb-examples-1.6.0/src'
> make[1]: *** [all-recursive] Error 1
> make[1]: Leaving directory
> `/home/oscarin/Downloads/felabs/sysdev/buildroot/buildroot-2013.08.1/output/build/directfb-examples-1.6.0'
> make: ***
> [/home/oscarin/Downloads/felabs/sysdev/buildroot/buildroot-2013.08.1/output/build/directfb-examples-1.6.0/.stamp_built]
> Error 2
> 
> Would you please help me ?

Thanks for your report. Instead of using a 2 years old thread, it would
have been better to post this as a new message to the mailing list.

Could you retry with the latest Buildroot version (2014.05), and if the
problem still exists, please include your complete Buildroot .config
file so that we can reproduce the issue.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
