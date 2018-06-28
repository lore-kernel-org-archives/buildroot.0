From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 28 Jun 2018 07:42:40 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-06-27
In-Reply-To: <20180628060020.108D0208B3@mail.bootlin.com>
References: <20180628060020.108D0208B3@mail.bootlin.com>
Message-ID: <CANQCQpaLoVCCxOvJjZL-TWUTevjrHJZWf7_4cD2yhCJ+1BHTvw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 28, 2018 at 1:00 AM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> Build statistics for 2018-06-27
> ===============================
>

>      powerpc |                  gnutls-3.5.18 | NOK | http://autobuild.buildroot.net/results/7c4bcb839f0ad5bc0496b4115ff391a3b312581a |

Seems like the failure is back related to non-wchar, I haven't done a
blame yet to see recent changes but looks similar to why the following
was reverted.
http://lists.busybox.net/pipermail/buildroot/2013-February/066729.html

Matt
