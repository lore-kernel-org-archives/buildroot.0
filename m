From: Felipe Contreras <felipe.contreras@gmail.com>
Date: Tue, 25 Jan 2011 04:51:00 +0200
Subject: [Buildroot] [PATCH 3rd RESEND 2/6] Fix gstreamer packages for
	make 3.82
In-Reply-To: <877hduitku.fsf@macbook.be.48ers.dk>
References: <1295822495-16972-1-git-send-email-felipe.contreras@gmail.com>
	<1295822495-16972-3-git-send-email-felipe.contreras@gmail.com>
	<877hduitku.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTimbpB9pdWg2wBPz3Je-CjGPPiduGE-6U9vHCb-4@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, Jan 24, 2011 at 10:39 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Felipe" == Felipe Contreras <felipe.contreras@gmail.com> writes:
>
> ?Felipe> These packages would get fixed on the next releases, but each one gets
> ?Felipe> released at different periods. For now this is needed to build on 3.82.
>
> ?Felipe> I only tested gstreamer, gst-plugins-base, and
> ?Felipe> gst-plugins-good, but all the ones using the 'common' submodule
> ?Felipe> should have this issue.
>
> There recently were a number of new gst-* releases. I took a quick look
> at gst-plugins-base-0.10.32, an no longer see that gtkdoc line.
> Wouldn't it make more sense to update now instead of adding this hack?

Well, _some_ packages have been released: gstreamer core, plugins
base, good, bad and ugly, in short, I think everything except
gst-ffmpeg. And yeah, this is the "next release" I was talking about,
so it might make sense to jump to this release (if it compiles), but
I'm not sure if the hack would still be needed for some packages.

Cheers.

-- 
Felipe Contreras
