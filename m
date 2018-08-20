From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 17:15:23 +0200
Subject: [Buildroot] [[PATCH v2 08/14] package/mender: remove tenant.conf
In-Reply-To: <20180820130914.22377-9-mirza.krak@northern.tech>
References: <20180820130914.22377-1-mirza.krak@northern.tech>
 <20180820130914.22377-9-mirza.krak@northern.tech>
Message-ID: <20180820171523.465489e7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Aug 2018 15:09:08 +0200, Mirza Krak wrote:
> Tenant Token is a configuration option that has to do with Hosted Mender,
> where you you need to set this for the devices to connect to the
> correct organization in a multi-tenant system.
> 
> The removal of tenant.conf usage (and /var/lib/mender/authtentoken)
> was in Mender client version 1.2.0, where it was switched to be an mender.conf
> option instead as the example above demonstrates. As the first version that was
> integrated in Buildroot was 1.4.0, the inclusion of tenant.conf and the
> creation of the symlink is not necessary.
> 
> Now it is specified as such in mender.conf:
> 
> Example:
> 
> /etc/mender/mender.conf
> {
>     TenantToken: "very long base64 encoded string"
> }
> 
> Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
