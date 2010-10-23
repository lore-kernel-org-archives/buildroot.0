From: Martin Banky <martin.banky@gmail.com>
Date: Sat, 23 Oct 2010 14:53:08 +0200
Subject: [Buildroot] [git commit master 1/1] buildroot.html: html code
	clean-up and other issues - Part2
Message-ID: <20101023143215.8EE5D8D3C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2b504fe1f6f67bd2d12107c4c00248cb63a35e27
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current DocType declaration was incorrect. It is neither xhtml strict nor
xhtml transitional. So, instead of dealing with that issue, converted it to
validated Html5.

Fixed white-space errors.
Removed validator html4.01 code.
Color corrected the code sections.
Removed redundant or useless html code.
Changed foo to libfoo, for consistency.
Changed page bookmarking to use header id's.
Re-flowed paragraphs to line break at 80 characters.
Re-formatted the code sections for consistency and correctness.
Kept all list items, headings, and href's on a single line (where possible).

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

Patch is too large, so refusing to show it
