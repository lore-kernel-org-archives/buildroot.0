From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 25 Mar 2013 07:38:18 +0100
Subject: [Buildroot] Interest in upgrading syslinux to 5.x?
In-Reply-To: <EBADBC9F10F448F49B067CB7A90C908C@beraninstruments.com.local>
References: <CAKduhSuJ_-2B7i7YOKyuErfhve_CXi1UvmNX_U7iQUXYt3c7hw@mail.gmail.com><ECCCCA15FFC640AAA891EA6FC4BB8F28@beraninstruments.com.local>
 <CAKduhSt3Vkpc+bLP4UM8On472BZqZ7aRVRmFZsG0kOKEm4XtEg@mail.gmail.com>
 <2F83768108B8464BAD971EB5BCDBE1E5@beraninstruments.com.local>
 <EBADBC9F10F448F49B067CB7A90C908C@beraninstruments.com.local>
Message-ID: <514FF0DA.4030105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/03/13 13:29, Will Moore wrote:
> It might help to see what Arnout is up to with his grub2 patch which is also
> looking at providing a bootloader with host and target tools.  See
> http://patchwork.ozlabs.org/patch/191813/

  That patch has been sitting in the freezer :-)

  As you can see from the corresponding mail thread, there is no 
convergence about what to call the two variants of a bootloader. It's a 
bit like gcc: the normal variant builds an installer running on the host, 
but it includes binary code for the target; the other variant is 
completely running on the target.

  Note that for u-boot, the chosen solution is to create a completely 
separate package uboot-tools for the target. But it's a bit a special 
case, because mkimage is not an installer.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
