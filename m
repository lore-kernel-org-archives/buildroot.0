From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sat, 12 Sep 2015 10:34:02 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-09-11
In-Reply-To: <20150912063017.0EBCC10190C@stock.ovh.net>
References: <20150912063017.0EBCC10190C@stock.ovh.net>
Message-ID: <55F3F18A.6080606@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 12/09/15 07:30, Thomas Petazzoni wrote:
> Build statistics for 2015-09-11

>      mips64el |                      gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/904746420097ce3b042b3d851fecfca2f5f13f2e/
>      mips64el |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/968cb98302c01fd206db65dfb412073b1ee017bc/
>      mips64el |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/52798d9d3900f34fc4b1d40dd71f5211dbf14561/
>      mips64el |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/777a9c321a3367ea097786c25ed98e131433859f/

Already fixed by:

 
http://git.buildroot.net/buildroot/commit/?id=3aecfbd03dd2a8d49c97f1e68df42b077dbbd396

>      mips64el |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/697867a1faa1855d296a999e128d1698824ec265/
>      mips64el |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/7d7486b5f34087bb26bf9f57ac76fef9eaf1f08a/

Patch to fix it:

   https://patchwork.ozlabs.org/patch/507916/

>      mips64el |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/c537ea79f43498de4940599daacee70362219a83/

Patch to fix it:

   https://patchwork.ozlabs.org/patch/516660/

Regards,

Vincent.
