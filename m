From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Dec 2019 15:17:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/linux-tools: add support for
 Hyper-V tools
In-Reply-To: <509f4b23-4223-06e4-508d-295d1a598f5a@eu.citrix.com>
References: <1575639071-32764-1-git-send-email-simon.rowe@citrix.com>
 <509f4b23-4223-06e4-508d-295d1a598f5a@eu.citrix.com>
Message-ID: <20191206151712.4a3ea674@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Pascal in Cc.

On Fri, 6 Dec 2019 13:33:50 +0000
Simon Rowe <simon.rowe@eu.citrix.com> wrote:

> What's the probability of that, someone else just sent a patch 15 
> minutes ago while I was testing this one,

Pascal: the approach of Simon is to have a single option to
build/install all tools. Do we really need one option per tool like you
implemented? In which use cases would only a subset of the tools be
needed? What is the installed size of each tool?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
