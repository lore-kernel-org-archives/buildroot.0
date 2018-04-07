From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sat, 7 Apr 2018 08:08:45 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-04-06
In-Reply-To: <20180407060014.442812075D@mail.bootlin.com>
References: <20180407060014.442812075D@mail.bootlin.com>
Message-ID: <CANQCQpYgpF5c1KQMjZfa3mkcoX05nx7ZtttvErPB+Z78Mr=S2A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch / All,

On Sat, Apr 7, 2018 at 1:00 AM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> Build statistics for 2018-04-06
> ===============================

>         i586 |                    picocom-3.1 | NOK | http://autobuild.buildroot.net/results/3d874d1bc838f69b6411d018065015f851caf1e9 |

New musl failure with 3.1 (they added a new custom baud option).  I
started a issue upstream.
https://github.com/npat-efault/picocom/issues/100
