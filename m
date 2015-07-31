From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Jul 2015 09:45:04 +0200
Subject: [Buildroot] GNU Coreutils Cut Bug
In-Reply-To: <CA+h8R2rKT2qWkV7nmA+EyidOZuE+vT_8cGN8eb0wXfNqoS=U-Q@mail.gmail.com>
References: <CA+h8R2rKT2qWkV7nmA+EyidOZuE+vT_8cGN8eb0wXfNqoS=U-Q@mail.gmail.com>
Message-ID: <20150731094504.01ea3893@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Christian Stewart,

On Thu, 30 Jul 2015 23:13:10 +0000, Christian Stewart wrote:

> I'm using `cut (GNU coreutils) 8.24`.
> 
> The command: `echo "TEST=test" | cut -d"=" -f2-` outputs `Ttest`. I don't
> think this is the intended behavior. It should output "test".
> 
> Am I using it wrong or is there something wrong with coreutils?

FWIW, our oldest bug in the bug tracker is about this. Unfortunately,
for some reason our bug tracker is down at the moment, so I can't check
if it's exactly the same issue, but it probably is.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
