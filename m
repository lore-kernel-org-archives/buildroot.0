From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 16 May 2012 19:21:45 +0200
Subject: [Buildroot] [PATCH v2 10/11] manual: add get-involved.txt
In-Reply-To: <1336905501-9757-11-git-send-email-s.martin49@gmail.com>
References: <4FAEEFA8.2070005@mind.be>
 <1336905501-9757-1-git-send-email-s.martin49@gmail.com>
 <1336905501-9757-11-git-send-email-s.martin49@gmail.com>
Message-ID: <CAAXf6LUW52xNUt2vFt56ZP_s3Ug0xRXOJ0mbKPNfKv_AyW0SgA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, May 13, 2012 at 12:38 PM, Samuel Martin <s.martin49@gmail.com> wrote:
> From: Samuel MARTIN <s.martin49@gmail.com>
>
>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>
> ?create mode 100644 docs/manual/get-involved.txt
>
> diff --git a/docs/manual/get-involved.txt b/docs/manual/get-involved.txt
> new file mode 100644
> index 0000000..9b6e843
> --- /dev/null
> +++ b/docs/manual/get-involved.txt
> @@ -0,0 +1,67 @@
> +Getting involved
> +================
> +
> +Like any open source projects, Buildroot has different ways to share
> +information in its community and outside.

s/projects/project/

> +
> +One piece of it is the document you are currently reading ;-).
> +
> +Each of those ways may interest you if you are look for some help,
> +want to understand Buildroot or contribute to the project.
> +
> +Mailing List
> +------------
> +
> +Buildroot has a mailing list
> +http://lists.busybox.net/pipermail/buildroot[] for discussion and
> +development.
> +
> +[[mailing-list-subscribe]]
> +
> +Subscribing to the mailing list
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +You can subscribe by visiting
> +http://lists.busybox.net/mailman/listinfo/buildroot[].
> +Only subscribers to the Buildroot mailing list are allowed to post to
> +this list.
> +
> +The list is also available through _Gmane_ http://gmane.org[], at
> ++gmane.comp.lib.uclibc.buildroot+
> +http://dir.gmane.org/gmane.comp.lib.uclibc.buildroot[].
> +
> +Searching the List Archives
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Please search the mailing list archives before asking questions on the
> +mailing list, since there is a good chance someone else has asked the
> +same question before. Checking the archives is a great way to avoid
> +annoying everyone on the list with frequently asked questions...
> +
> +IRC
> +---
> +
> +The Buildroot IRC is irc://freenode.net/#buildroot[].
> +The channel +#buildroot+ is hosted on Freenode
> +http://webchat.freenode.net[].
> +
> +When asking for help on the IRC, share relevant logs or piece of code
> +using a code sharing website (see
> +http://en.wikipedia.org/wiki/Comparison_of_pastebins[], and pick up
> +one).

s/the IRC/IRC/
s/piece of code/pieces of code/
s/pick up/pick/

> +
> +Bugtracker
> +----------
> +
> +The Buildroot bugtracker is at https://bugs.uclibc.org[].

It is also reachable through bugs.buildroot.org, so I think we should
use that URL in the documentation.

> +
> +Buildroot wikipage
> +------------------
> +
> +Consecutively to the Buildroot developer day February 3, 2012,
> +a page dedicated to Buildroot has been created on
> +http://elinux.org[elinux.org].

'Consecutively to' feels strange to me. I'd write 'After'
I think you should put 'on' before February.

> +
> +This page is reachable at http://elinux.org/Buildroot[].
> +
> +Currently, this page is mainly used as a _todo-list_.
> diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
> index aa0952e..b23e9c1 100644
> --- a/docs/manual/manual.txt
> +++ b/docs/manual/manual.txt
> @@ -25,6 +25,8 @@ include::going-further.txt[]
>
> ?include::developer-guide.txt[]
>
> +include::get-involved.txt[]
> +
> ?include::legal-notice.txt[]
>
>
> --
> 1.7.10.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
