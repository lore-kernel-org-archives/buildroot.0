From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 11:48:13 +0100
Subject: [Buildroot] No rule to make target 'host-python !!
In-Reply-To: <CAGshWo1eWoWDUd_0jD8xQbpZg7dGzOzhwNeNmhrc5ewh9z6TSQ@mail.gmail.com>
References: <CAGshWo02DNPmGa_Nj7aBjf5TrQgVz2ePTP8EkABRfGFSYBsU0A@mail.gmail.com>
 <CAGshWo1eWoWDUd_0jD8xQbpZg7dGzOzhwNeNmhrc5ewh9z6TSQ@mail.gmail.com>
Message-ID: <20210123114813.0f7048c2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 22 Jan 2021 23:53:30 +0100
manu f <e.fiancette@gmail.com> wrote:

> ok, I remove libevdev in Target package =>libraries=>Other and its copile
> without error!
> 
> (But I dont know if I realy need this lib... )
> 
> Well why it no compile with libdevdev ?
> @ Thomas Petazzoni I saw you already got problem and make patch for
> host-python interpreter...is there something to see with ?

host-python is definitely part of Buildroot 2020.02, so I'm not sure
how you can get this error. We would need more details, such as the
complete .config that reproduces the issue.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
