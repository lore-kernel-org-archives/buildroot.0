From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Nov 2020 09:55:27 +0100
Subject: [Buildroot] [PATCH 09/10] support/scripts/{pkg-stats, cve.py,
 cve-checker}: support CPE ID based matching
In-Reply-To: <87eel8198x.fsf@dell.be.48ers.dk>
References: <20201104145145.1316167-1-thomas.petazzoni@bootlin.com>
 <20201104145145.1316167-10-thomas.petazzoni@bootlin.com>
 <CANQCQpbd3KhH9MLAFMXMzw6u=2wKX0o+jH2-VuoQDjiOnNt+aw@mail.gmail.com>
 <87eel8198x.fsf@dell.be.48ers.dk>
Message-ID: <20201105095527.1888e77e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 05 Nov 2020 09:46:38 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Yes, I noticed that as well while updating CHANGES for 2020.11-rc1. It
> also reads stdin before handling the command line arguments, so you
> cannot just run ./support/scripts/cve-checker --help to get usage info
> :/

See patch 02/10 in this series, which fixes precisely this.

However, I am about to send a patch series that drops cve-checker
entirely, by making pkg-stats provide the same functionality.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
