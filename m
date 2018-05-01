From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 1 May 2018 10:12:20 -0500
Subject: [Buildroot] [PATCH 2/4] package/Makefile.in: Add missing
 options to LDFLAGS for full RELRO build
In-Reply-To: <20180425064518.31797-2-stefan.sorensen@spectralink.com>
References: <20180425064518.31797-1-stefan.sorensen@spectralink.com>
 <20180425064518.31797-2-stefan.sorensen@spectralink.com>
Message-ID: <CANQCQpbqT0F8Gai-VW-bh7wZ1XM86JSjVcjck07vvGkhdR+WCg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan,

On Wed, Apr 25, 2018 at 1:45 AM, Stefan S?rensen
<stefan.sorensen@spectralink.com> wrote:
> The options for a full RELRO build should also be added to LDFLAGS.
>
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>



Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
