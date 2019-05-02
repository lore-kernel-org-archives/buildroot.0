From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 2 May 2019 09:52:13 +0200
Subject: [Buildroot] [PATCH 2/2] package/mfgtools: bump to version 1.2.91
In-Reply-To: <7552b9cbd58edcd667f52531ed75e3fe57cd705c.camel@embedded.rocks>
References: <20190430201121.15634-1-joerg.krause@embedded.rocks>
 <20190430201121.15634-2-joerg.krause@embedded.rocks>
 <880fdc14-d19f-020b-9735-9e0077e6be76@mind.be>
 <7552b9cbd58edcd667f52531ed75e3fe57cd705c.camel@embedded.rocks>
Message-ID: <4bf9c494-f6dc-e1a8-abad-3d87cbf1e051@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02/05/2019 08:51, J?rg Krause wrote:
>>> The
>>> problem is, that git provides the version information of Buildroot.
>>  Is it that much of a problem if the Buildroot version is used?
> mfgtools saves the version string in generated runtime scripts. So this
> is a problem.

 Yes, I understand that. But the effect is that `uuu --version` will print
2019.02 instead of 1.2.91, right? So my question is: is it that much of a
problem that this happens?

 I'm asking because I'm sure there are other packages that have that behaviour.
Are we going to try to find and fix all of them? Or just live with the fact that
some packages report the wrong version?

 Regards,
 Arnout
