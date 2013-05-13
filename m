From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 13 May 2013 08:38:04 +0200
Subject: [Buildroot] [PATCH] gst-plugins-bad: fix build of directfb
	plugin
In-Reply-To: <1368398587-21415-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Mon, 13 May 2013 00:43:07 +0200")
References: <1368398587-21415-1-git-send-email-arnout@mind.be>
Message-ID: <87y5bjtmer.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
 Arnout> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 Arnout> ---
 Arnout>  .../gst-plugins-bad-0002-fix-dfb-example.patch     | 22 ++++++++++++++++++++++
 Arnout>  1 file changed, 22 insertions(+)
 Arnout>  create mode 100644 package/multimedia/gst-plugins-bad/gst-plugins-bad-0002-fix-dfb-example.patch

 Arnout> diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad-0002-fix-dfb-example.patch b/package/multimedia/gst-plugins-bad/gst-plugins-bad-0002-fix-dfb-example.patch
 Arnout> new file mode 100644
 Arnout> index 0000000..b205748
 Arnout> --- /dev/null
 Arnout> +++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad-0002-fix-dfb-example.patch
 Arnout> @@ -0,0 +1,22 @@
 Arnout> +Fix dfb-example
 Arnout> +

That's an odd title. Did you mean somtehing like 'Fix directfb plugin
with dfb 1.6.x'?

Other than that it looks good. Thanks for looking into it, it was still
on my todo.

-- 
Bye, Peter Korsgaard
