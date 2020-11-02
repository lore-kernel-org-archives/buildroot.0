From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 2 Nov 2020 19:57:35 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/libcap: add upstream patches
 to bring support to disable thread
In-Reply-To: <20201102123425.25727-1-heiko.thiery@gmail.com>
References: <20201102123425.25727-1-heiko.thiery@gmail.com>
Message-ID: <CAEyMn7Zoa2oaKyjpa063XMmYY4+mGffkz99XrCvo1exQrRQubw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Am Mo., 2. Nov. 2020 um 13:34 Uhr schrieb Heiko Thiery <heiko.thiery@gmail.com>:
>
> The latest release is not able to build on environments w/o thread
> support. This commit adds support for that.
>
> - add PTHREADS to package make flags
> - change DYNAMIC with SHARED parameter of package make flags
> - add several mainline patches to get support for disabling threads
> - modify patch from Thomas to meet current shape of makefile
> - drop patch from Thomas Petazzoni and replace with upstream one that
>   introduces supports for SHARED option
>
> Fixes:
> http://autobuild.buildroot.net/results/fc1e7573327c7412dfa45b45a96966d993c7fc86/
>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> CC: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---

I will drop this patch since libcap 2.45 will be released sometime
this week. And work done in this patch is included in the release.

Thank you

--
Heiko
