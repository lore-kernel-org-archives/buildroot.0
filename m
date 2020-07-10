From: Ed Spiridonov <edo.rus@gmail.com>
Date: Fri, 10 Jul 2020 15:18:44 +0300
Subject: [Buildroot] [PATCH] package/lz4: add option to install library
 only (without lz4 binary)
In-Reply-To: <20200523173425.15367-1-edo.rus@gmail.com>
References: <20200523173425.15367-1-edo.rus@gmail.com>
Message-ID: <CACm0Nn0B7Ev0pf8SfDzQUimuo+uKqdV2i53YcecvEQuyRqxiYw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, May 23, 2020 at 8:35 PM Ed Spiridonov <edo.rus@gmail.com> wrote:
>
> Often lz4 is used as a library, and not as a standalone program.
> Excluding lz4 binary will save some space in this case.

Something wrong with this patch?
