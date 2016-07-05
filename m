From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 15:59:29 +0200
Subject: [Buildroot] [PATCH 07/24 v2] system: provide no default for
 custom skeleton path
In-Reply-To: <fc45f1eb2c78908429ed2dd0551097a3df653ccf.1466622379.git.yann.morin.1998@free.fr>
References: <cover.1466622379.git.yann.morin.1998@free.fr>
 <fc45f1eb2c78908429ed2dd0551097a3df653ccf.1466622379.git.yann.morin.1998@free.fr>
Message-ID: <20160705155929.54a0cc20@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Jun 2016 21:07:29 +0200, Yann E. MORIN wrote:
> Being custom means that our default one is not suitable to start with.
> 
> So there is no reson to offer it as the default path.
> 
> Add a separating empty line, for good measure, too.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Looks good, but I'll wait for a respin with the check that the path is
not empty.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
