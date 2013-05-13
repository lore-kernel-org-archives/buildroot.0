From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 13 May 2013 12:24:27 +0200
Subject: [Buildroot] [PATCH] gst-plugins-bad: fix build of directfb
	plugin
In-Reply-To: <87y5bjtmer.fsf@dell.be.48ers.dk>
References: <1368398587-21415-1-git-send-email-arnout@mind.be>
 <87y5bjtmer.fsf@dell.be.48ers.dk>
Message-ID: <5190BF5B.7050104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/05/13 08:38, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:
>
>   Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
>   Arnout> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>   Arnout> ---
>   Arnout>  .../gst-plugins-bad-0002-fix-dfb-example.patch     | 22 ++++++++++++++++++++++
>   Arnout>  1 file changed, 22 insertions(+)
>   Arnout>  create mode 100644 package/multimedia/gst-plugins-bad/gst-plugins-bad-0002-fix-dfb-example.patch
>
>   Arnout> diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad-0002-fix-dfb-example.patch b/package/multimedia/gst-plugins-bad/gst-plugins-bad-0002-fix-dfb-example.patch
>   Arnout> new file mode 100644
>   Arnout> index 0000000..b205748
>   Arnout> --- /dev/null
>   Arnout> +++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad-0002-fix-dfb-example.patch
>   Arnout> @@ -0,0 +1,22 @@
>   Arnout> +Fix dfb-example
>   Arnout> +
>
> That's an odd title. Did you mean somtehing like 'Fix directfb plugin
> with dfb 1.6.x'?

  It's not actually the plugin that fails to compile, it's the 
dfb-example program that is built but not installed. So perhaps a simpler 
solution would have been to remove it from Makefile.am and autoreconfigure.

  I'm probably not going to have time to resubmit in the coming days, so 
if you're willing to take over, please do.

  Regards,
  Arnout

>
> Other than that it looks good. Thanks for looking into it, it was still
> on my todo.
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
