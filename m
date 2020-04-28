From: Slydder <slydder101@gmail.com>
Date: Tue, 28 Apr 2020 13:51:35 +0300
Subject: [Buildroot] [PATCH v4 1/3] package/environment-setup: new
 package
In-Reply-To: <CA+TH9V=-7jwQSQvoLoAwNvDe4OtHf9N442FHW=HGBX78a4CivA@mail.gmail.com>
References: <20200425124836.122729-1-angelo@amarulasolutions.com>
 <96aada93-1fbf-19c5-ad8e-e293b121468a@bitdefender.com>
 <CA+TH9V=-7jwQSQvoLoAwNvDe4OtHf9N442FHW=HGBX78a4CivA@mail.gmail.com>
Message-ID: <0591f3e8-888e-e683-318e-349dae5ecc3f@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

> If the PS1 thing is so bothering we can remove it, but I strongly
> disagree. 
Please drop it. If somebody wants to change PS1, than it can be moved to 
a wrapper script. But keep in the environment script only the strict 
necessary.

Best regards,
Slydder
