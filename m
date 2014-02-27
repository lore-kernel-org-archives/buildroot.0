From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 27 Feb 2014 07:35:44 +0100
Subject: [Buildroot] [PATCH v2] website: brand new version !
In-Reply-To: <1393456468-19111-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1393456468-19111-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <530EDCC0.7060300@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Maxime,

 Great work!

On 02/27/14 00:14, Maxime Hadjinlian wrote:
> A brand new identify for buildroot.org

 identity

> This should at least give us a few years before we need to it again.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
> Changes v1 -> v2:
>   - Fix typo in discutions => discussions
>   - Add a "filter" to avoid git commit mail in mailing activity
> ---
>  README                                     |   59 +
>  docs/README                                |   59 -
>  docs/about.html                            |   11 +-
>  docs/contribute.html                       |   39 +
>  docs/copyright.txt                         |    2 +-
>  docs/css/bootstrap-responsive.css          | 1092 +++++
>  docs/css/bootstrap-responsive.min.css      |    9 +
>  docs/css/bootstrap.css                     | 6039 ++++++++++++++++++++++++++++
>  docs/css/bootstrap.min.css                 |  882 ++++
>  docs/css/bootswatch.less                   |  181 +
>  docs/css/variables.less                    |  301 ++
>  docs/developer.html                        |   47 -
>  docs/docs.html                             |    4 +-
>  docs/download.html                         |   46 +-
>  docs/footer.html                           |   24 +-
>  docs/git.html                              |   44 -
>  docs/header.html                           |  102 +-
>  docs/images/glyphicons-halflings-white.png |  Bin 0 -> 8777 bytes
>  docs/images/glyphicons-halflings.png       |  Bin 0 -> 12799 bytes
>  docs/images/logo.png                       |  Bin 129459 -> 117499 bytes
>  docs/images/menuconfig.png                 |  Bin 9087 -> 8604 bytes
>  docs/index.html                            |   34 +-
>  docs/js/bootstrap.js                       | 2159 ++++++++++
>  docs/js/bootstrap.min.js                   |    6 +
>  docs/js/buildroot.js                       |   63 +
>  docs/js/jquery-1.10.2.min.js               |    6 +
>  docs/lists.html                            |   40 -
>  docs/news.html                             |  115 +-
>  docs/sponsors.html                         |    2 +-
>  docs/stylesheet.css                        |   75 -
>  docs/support.html                          |   45 +
>  31 files changed, 11067 insertions(+), 419 deletions(-)

 Clearly, a patch like this is impossible to review...

 Could you:

* split of the things that are just downloaded into separate patches (and
clearly mention that it is just downloading something, as well as the
place where it was downloaded from);

* use the -M option to track movements, or set format.find-renames=true;

* split off the patches that use bootstrap from the patches that really
change something;

* put the website live somewhere so we can see what it looks like;

* give more descriptive commit messages?


 While you're doing this, it would also be nice to move the website into
a separate directory. Not that there is anything except website and
manual in the docs directory, but it would clarify things. Or maybe we
could even remove the docs directory and put manual and website at the
top-level. Anyway, that would be in a separate, final patch.


 Thanks!


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
