From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Tue, 23 Jun 2015 09:56:14 +0200
Subject: [Buildroot] [PATCH 1/1] Force rebuild of local site packages
	and theirs local dependencies
In-Reply-To: <5587E032.8030506@syscom-instruments.com>
References: <1434460888-30770-1-git-send-email-viallard@syscom-instruments.com>
 <20150616215022.6eb61f22@free-electrons.com>
 <5587E032.8030506@syscom-instruments.com>
Message-ID: <2854682.pCSB3Zb5Zv@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Anthony,

On Monday 22 June 2015 12:15:14 Viallard Anthony wrote:
[..]
> The main thing is this not convenient. I have about 30 packages and we 
> are a team. I don't want to check after each git pull the packages which 
> have been modified and call make <pkg>-rebuild for each of them (and be 
> aware about dependencies, for example calling libraries rebuild before 
> because the <pkg>-rebuild target doesn't rebuild the dependencies).

Does this process would work?

  rm build/*/.stamp_built
  make


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
