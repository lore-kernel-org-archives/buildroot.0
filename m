From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 5 Dec 2015 18:21:25 +0100
Subject: [Buildroot] [PATCH 0/4] website caring
In-Reply-To: <1449213674-11333-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1449213674-11333-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <56631D15.7090302@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Angelo,

 Thanks for this series, it's really good that someone cares for the website!

On 04-12-15 08:21, Angelo Compagnucci wrote:
> This patch series:
> 
> * Fixes all errors found by html tidy
> * Fixes indentation on all html using html tidy rules
> * Add tidy_config.txt with tidy configuration used in
>   reindentation
> * Resizes images to a correct size

 It would be good to also specify the size of the images everywhere in the img
tags, since that speeds up page rendering and makes sure that it is still laid
out in the same way when showing without images.


 Also, there are quite a lot of images with an empty alt tag. That's pretty
useless and it would be good to add real alt text, e.g. "gzip" for the .tar.gz
and "bz2" for the tar.bz2.

> * Minor cosmetic changes to docs and download pages
> 
> Angelo Compagnucci (4):
>   docs/website: fixing html tidy errors and warnings
>   docs/website: html cleaning and indentation fixing
>   docs/website: resizing images

 The list didn't receive this one, probably because it was too big. Peter, did
you get it?

 I guess that one can be applied independently of the other patches?

 Regards,
 Arnout


>   docs/website: cosmetic changes
> 
>  docs/website/contribute.html     |   74 +-
>  docs/website/css/main.css        |   15 +-
>  docs/website/docs.html           |  237 +-
>  docs/website/download.html       |  354 +--
>  docs/website/footer.html         |   12 +-
>  docs/website/header.html         |  120 +-
>  docs/website/images/browser.png  |  Bin 18175 -> 8927 bytes
>  docs/website/images/gift.png     |  Bin 15906 -> 10565 bytes
>  docs/website/images/hammer.png   |  Bin 18353 -> 11740 bytes
>  docs/website/images/logo.png     |  Bin 117499 -> 83758 bytes
>  docs/website/images/package.png  |  Bin 7746 -> 5449 bytes
>  docs/website/images/pdf-icon.png |  Bin 10324 -> 5798 bytes
>  docs/website/images/text.png     |  Bin 6437 -> 3824 bytes
>  docs/website/images/tux-flat.png |  Bin 20106 -> 14812 bytes
>  docs/website/images/zip.png      |  Bin 8208 -> 5164 bytes
>  docs/website/index.html          |  241 +-
>  docs/website/news.html           | 6343 +++++++++++++++++++++-----------------
>  docs/website/sponsors.html       |  459 +--
>  docs/website/support.html        |  187 +-
>  docs/website/tidy_config.txt     |    5 +
>  20 files changed, 4495 insertions(+), 3552 deletions(-)
>  create mode 100644 docs/website/tidy_config.txt
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
