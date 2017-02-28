From: Taceant Omnes <taceant@gmail.com>
Date: Tue, 28 Feb 2017 15:40:09 +0000
Subject: [Buildroot] Ethernet not working with imx6ulevk
In-Reply-To: <CAKkGsYK+WPvgH-SQ9L_cbBkjCOOXK9YE4ty6L5wQDhJOmYR==Q@mail.gmail.com>
References: <CAKkGsYK+WPvgH-SQ9L_cbBkjCOOXK9YE4ty6L5wQDhJOmYR==Q@mail.gmail.com>
Message-ID: <CAKkGsYLpW+bU-SihBgRFgyi4cmzJhgah1ZDpjQf0m2ksEmKP_A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23 February 2017 at 14:30, Taceant Omnes <taceant@gmail.com> wrote:
> Hi all,
>
> Has anybody got Ethernet working with imx6ulevk?

Yes.

Here is how to get Ethernet working with imx6ulevk with
buildroot-2016.11.2 (as well as with the buildroot git master at the
time of writing this email).

1. Download the attachment (zipped patch file) listed towards the end
of this page: https://community.nxp.com/docs/DOC-333163
2. Unzip the patch file to some folder.
3. 'make nconfig' to set BR2_LINUX_KERNEL_PATCH to the full path of
the patch file.
4. make

That is it.

Cheers.
