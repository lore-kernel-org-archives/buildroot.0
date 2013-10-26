From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 26 Oct 2013 07:01:26 -0300
Subject: [Buildroot] [RFC] pkg-python infrastructure
In-Reply-To: <OFCFB88498.0047424B-ON86257C0F.0057371F-86257C0F.0057386F@rockwellcollins.com>
References: <OFCFB88498.0047424B-ON86257C0F.0057371F-86257C0F.0057386F@rockwellcollins.com>
Message-ID: <526B92F6.20205@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/25/2013 12:52 PM, Ryan Barnett wrote:

> pkg-python infrastructure
> -------------------------

* Packages should declare if they're python2 and/or python3 compatible.

Right now packages are only for one or the other but not both, this
should be fixed when packages are happy about it (two build/install
phases if enabled).

Regards.
