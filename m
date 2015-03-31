From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Mar 2015 13:56:36 +0200
Subject: [Buildroot] [PATCH] jsoncpp: fix build for non C++11 toolchains
In-Reply-To: <37b3e007267cbef5bd458fc06e21e9893f3eb0a4.1427778355.git.baruch@tkos.co.il>
References: <37b3e007267cbef5bd458fc06e21e9893f3eb0a4.1427778355.git.baruch@tkos.co.il>
Message-ID: <20150331135636.441fb8a4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Tue, 31 Mar 2015 08:05:55 +0300, Baruch Siach wrote:
> Add a patch removing reference to std::snprintf that is only in C++11.
> 
> Fixes:
> http://autobuild.buildroot.net/results/b39/b390beeb9a6fea12f1a4d9f2ff9a8a483628cad2/
> http://autobuild.buildroot.net/results/d18/d18b3e116b680a3897fbea296938e900a1e5e80a/
> http://autobuild.buildroot.net/results/1b2/1b20a2f81dd2b409785930705222bc03576c4907/
> 
> and many more.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
