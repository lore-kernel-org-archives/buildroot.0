From: =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Mon, 11 Dec 2017 14:11:05 +0100
Subject: [Buildroot] [PATCH v1] qt5charts: fix qt5base widgets/gui
 selection
In-Reply-To: <20171210220131.29440-1-ps.report@gmx.net>
References: <20171210220131.29440-1-ps.report@gmx.net>
Message-ID: <b772243d-f23d-2ecf-8ae0-be26d4d3b933@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On 12/10/2017 11:01 PM, Peter Seiderer wrote:
> Selection of BR2_PACKAGE_QT5BASE_WIDGETS needs BR2_PACKAGE_QT5BASE_GUI too.
> 
> Fixes qt5base configure failure ([1]):
> 
>   ERROR: Feature 'widgets' was enabled, but the pre-condition 'features.gui' failed.
> [1] http://autobuild.buildroot.net/results/69c4385b2fd484d16f749b4cde6967f5cabea8b2
> 
> and buildroot warning:
> 
>   warning: (... && BR2_PACKAGE_QT5CHARTS && ...) selects BR2_PACKAGE_QT5BASE_WIDGETS
>   which has unmet direct dependencies (BR2_PACKAGE_QT5 && BR2_PACKAGE_QT5BASE && BR2_PACKAGE_QT5BASE_GUI)
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Acked-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>

Regards,

-- 
S?bastien Szymanski
Software engineer, Armadeus Systems
Tel: +33 (0)9 72 29 41 44
Fax: +33 (0)9 72 28 79 26
