From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 18 Mar 2015 11:07:19 +0100
Subject: [Buildroot] [PATCH v3] gst1-imx: add package
In-Reply-To: <1426614168.3279.10.camel@jablotron.cz>
References: <1426614168.3279.10.camel@jablotron.cz>
Message-ID: <55094E57.8080706@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rostislav,

Rostislav Lisovy wrote:
> Hello everyone;
> Is there any chance the patch (in $subject)
> https://www.marc.info/?l=buildroot&m=141550615919434
> will be merged into the mainline Buildroot?
>
> After changing the GST1_IMX_VERSION to the newest 0.10.1
> everything compiles fine (the patch applies to the master as well).

I agree it should be merged. Or rejected, it there's a reason to do so.

Did you run-test it? Please specify what you tested, and formally add
your Tested-by tag. This makes it more likely for a patch to be merged.
See the manual [1] for details about reviewers tags.

Then Gary or you could resend the patch with the version updated.

[1] 
http://buildroot.net/downloads/manual/manual.html#_reviewing_and_testing_patches

-- 
Luca
