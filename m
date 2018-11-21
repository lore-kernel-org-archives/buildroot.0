From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 21 Nov 2018 22:55:33 +0100
Subject: [Buildroot] [PATCH 1/1] libv4l: v4l2-compliance needs fork
In-Reply-To: <87in0unti1.fsf@dell.be.48ers.dk>
References: <20181117205222.17636-1-fontaine.fabrice@gmail.com>
 <87in0unti1.fsf@dell.be.48ers.dk>
Message-ID: <20181121225533.7ca0f4f0@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Sun, 18 Nov 2018 19:13:58 +0100, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:  
> 
>  > Since bump to 1.16.2, v4l2-compliance uses fork, see:
>  > https://git.linuxtv.org/v4l-utils.git/commit/utils/v4l2-compliance/?id=79d98edd1a27233667a6bc38d3d7f8958c2ec02c  
> 
>  > So add a patch to disable v4l2-compliance if fork is unavailable  

Did you send the patch upstream?

Regards,
Peter

> 
>  > Fixes:
>  >  - http://autobuild.buildroot.org/results/447d792ce21c0e33a36ca9384fee46e099435ed8  
> 
>  > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>  
> 
> Committed, thanks.
> 
