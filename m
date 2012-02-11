From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 11 Feb 2012 17:14:27 +0100
Subject: [Buildroot] [PATCH] Add gst-av package
In-Reply-To: <87d39l1hwr.fsf@macbook.be.48ers.dk>
References: <1328919431-22820-1-git-send-email-felipe.contreras@gmail.com>
 <87d39l1hwr.fsf@macbook.be.48ers.dk>
Message-ID: <201202111714.27895.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday 11 February 2012 16:58:12 Peter Korsgaard wrote:
> >>>>> "Felipe" == Felipe Contreras <felipe.contreras@gmail.com> writes:
> 
>  Felipe> Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>
> 
> A more detailed commit message would be good. How does this differ from
> gst-ffmpeg? I see you depend on ffmpeg and not libav (which we currently
> don't have in BR).

 To be honest, I find it redundant to repeat the help text of Config.in in
the commit message when adding a new package.  When you look at the project
history, you will probably already have looked at the package's files first.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
