From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 15 Oct 2011 12:31:52 +0200
Subject: [Buildroot] [PATCH 4/9] New package: Google Breakpad library
In-Reply-To: <1318603921-22899-5-git-send-email-will_wagner@carallon.com>
References: <1318603921-22899-1-git-send-email-will_wagner@carallon.com>
 <1318603921-22899-5-git-send-email-will_wagner@carallon.com>
Message-ID: <201110151231.54170.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Friday 14 October 2011 16:51:56, Will Wagner wrote:
> diff --git a/package/breakpad/breakpad-782_crash_generation_server.patch b/package/breakpad/breakpad-782_crash_generation_server.patch
> new file mode 100644
> index 0000000..ca6693e
> --- /dev/null
> +++ b/package/breakpad/breakpad-782_crash_generation_server.patch
> @@ -0,0 +1,12 @@
> +Index: Makefile.am
> +===================================================================
> +--- a/Makefile.am      (revision 782)
> ++++ b/Makefile.am      (working copy)
> +@@ -64,6 +64,7 @@

 Patches should have a commit-log-like message at the top, including a
Signed-off-by line.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111015/86aaf34c/attachment.html>
