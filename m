From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 6 Feb 2019 10:13:47 -0600
Subject: [Buildroot] [PATCH v4 1/2] package/sg3_utils: add host build
In-Reply-To: <20190206161923.49ab5667@windsurf>
References: <1549285823-41193-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20190206161923.49ab5667@windsurf>
Message-ID: <CANQCQpasZsBk35uunHFt6DMbXRf0CTveJf8-1H8=izWNiKqDLw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, Feb 6, 2019 at 9:19 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Mon,  4 Feb 2019 07:10:22 -0600
> Matt Weber <matthew.weber@rockwellcollins.com> wrote:
>
> > Initially used by the host build of the utp_com package
> >
> > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> >
> > ---
> > Changes
>
> This patch causes some breakage:
>
>   http://autobuild.buildroot.net/results/2b3/2b30f4ae0074d7f89ed489dccf6b5eecdd40c909/build-end.log
>

I was unable to reproduce on a machine with..............
Linux largo 3.19.0-25-generic #26~14.04.1-Ubuntu SMP Fri Jul 24
21:16:20 UTC 2015 x86_64 x86_64 x86_64 GNU/Linux
/lib/x86_64-linux-gnu/ld-2.19.so
gcc (Ubuntu 4.9.4-2ubuntu1~14.04.1) 4.9.4

What's the bootlin autobuilder configuration?

Thanks!
Matt
