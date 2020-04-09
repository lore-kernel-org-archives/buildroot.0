From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Apr 2020 15:18:45 +0200
Subject: [Buildroot] how to make two defconfig simultaneously
In-Reply-To: <CA+h21hr+Ct3COWUv7ZfiHnwfWRb0GVw_A268qEG6WZD-VMyv7g@mail.gmail.com>
References: <VI1PR04MB513697495A894BC827B3CF0DFEC10@VI1PR04MB5136.eurprd04.prod.outlook.com>
 <20200409133434.20276005@windsurf.home>
 <CA+h21hpmV55Nh7HUA5WZ3QKU+yCPsnoLOVuNge8VyMbbK6EtHg@mail.gmail.com>
 <20200409142507.5de703f4@windsurf.home>
 <CA+h21hr+Ct3COWUv7ZfiHnwfWRb0GVw_A268qEG6WZD-VMyv7g@mail.gmail.com>
Message-ID: <20200409151845.7635fea8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 9 Apr 2020 15:45:35 +0300
Vladimir Oltean <olteanv@gmail.com> wrote:

> Ok, this answers the 'how to merge them' portion of the question.
> Are there guidelines for where defconfig fragments _can_ be stored,
> how they should be structured, named, what they can contain? All the
> files that I see in the configs/ folder are simple defconfigs.

They can be stored wherever you want, and there are no particular
guidelines on how they should be structured. Each project will have its
own constraints. What matters is that Buildroot takes as input a single
.config file: how this .config file is produced is not relevant to
Buildroot.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
