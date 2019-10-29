From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 29 Oct 2019 22:40:35 +0100
Subject: [Buildroot] [PATCH 1/2] package/xvisor: fix build on x86 with
 PIC/PIE
In-Reply-To: <20191029124241.5734-1-fontaine.fabrice@gmail.com>
References: <20191029124241.5734-1-fontaine.fabrice@gmail.com>
Message-ID: <33497820-89b6-f691-5bac-93572e4f0651@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/10/2019 13:42, Fabrice Fontaine wrote:
> Fixes:
>  - http://autobuild.buildroot.net/results/21d82ca5ca62d25be214a482017f4a671f7cc3d7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Peter, this one is for the stable branches. I applied the version bump to
master and that's sufficient for master.

 Regards,
 Arnout
