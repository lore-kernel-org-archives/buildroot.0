From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Mar 2019 22:30:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/angularjs: bump version to 1.7.8
In-Reply-To: <20190318214509.24478-1-aduskett@gmail.com>
References: <20190318214509.24478-1-aduskett@gmail.com>
Message-ID: <20190319223042.21b0e32c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

On Mon, 18 Mar 2019 17:45:09 -0400
aduskett at gmail.com wrote:

> -sha256	4d4e87d24c7d522f4ee765e4f7d454b9cf2a0f6407248545528064e66ad7b085	angular-1.6.7.zip
> -sha256	cec36623ceba33c503784164917c206047079159bf88f51a695a4dfb9d9b7ede	angular.js
> +sha256	4d1e5755d7722fed1fa223d854f209251bfee042c72ffe5cca63c4c1a7a19d78	angular-1.7.8.zip
> +sha256	db7862d0083ae74b5c94005d18274c3528f1be2932b72438e2f606a3d1f23ab5	angular.js

For the record: this broke legal-info:

  http://autobuild.buildroot.net/?reason=angularjs-legal-info

indeed, the hash you used was the one of angular.min.js and not the one
of angular.js.

I fixed this up in a follow-up commit.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
