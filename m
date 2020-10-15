From: Magnus Armholt <magnus.armholt@wapice.com>
Date: Thu, 15 Oct 2020 08:56:49 +0000
Subject: [Buildroot] pkg-stats support for external tree?
In-Reply-To: <20201015101754.55fb29c6@windsurf>
References: <HE1PR03MB298830C6E778223631A2A08AF0020@HE1PR03MB2988.eurprd03.prod.outlook.com>
 <20201015085753.33f3b15e@windsurf>
 <HE1PR03MB29888EA331AFE5BEE506CD53F0020@HE1PR03MB2988.eurprd03.prod.outlook.com>,
 <20201015101754.55fb29c6@windsurf>
Message-ID: <HE1PR03MB2988288351AAC346434D5CC6F0020@HE1PR03MB2988.eurprd03.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> So to me, the "latest upstream version" information really only makes
> sense for the pkg-stats on all Buildroot packages, i.e a tool for the
> Buildroot community/maintainers rather than a tool for Buildoot
> end-users.

> Or do you see it differently?

I agree, most of the time the latest upstream version is not that useful in LTS branch,
but I do see a use case when a package is listed to have CVE issues.
In that case, it is useful to see if there exists a new version upstream (which otherwise is the first thing to check).

Even though we are using the LTS branch (for exactly the reasons you listed), we do have a process to upgrade individual packages if the need is motivated (can also be non-security related if well motivated).
We dont have the possibility to keep up-to-date with the latest LTS minor version.
A more truthful scenario is an upgrade when the LTS is released (~February) which includes integration work and larger retesting of the system.
Later, usually after the summer, we upgrade to the latest LTS minor version.
At this moment the package list gets a second overhaul and all information related CVEs and possible upstream versions reduces our work.

I am very happy that you have started this work related to CVEs and highlighting the update possibilities, it is a great improvement.

-Magnus
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201015/0e3cfdb6/attachment.html>
