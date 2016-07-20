From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jul 2016 22:31:08 +0200
Subject: [Buildroot] [PATCH v3,3/3] alljoyn-tcl-base: new package
In-Reply-To: <1467884015-27464-3-git-send-email-fabrice.fontaine@orange.com>
References: <1467884015-27464-1-git-send-email-fabrice.fontaine@orange.com>
 <1467884015-27464-3-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20160720223108.4fa2548a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  7 Jul 2016 11:33:35 +0200, Fabrice Fontaine wrote:
> AllJoyn Base Services are common services used by many devices,
> providing a set of interfaces for different devices to interact and
> interoperate with one another.
> 
> Thin Client Library is designed to bring the benefits of the AllJoyn
> distributed programming environment to embedded systems.
> 
> https://allseenalliance.org
> 
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
> ---
> Changes v2 -> v3 (after review of Romain Naour):
>  - Rewrap Config.in help text
>  - Replace dependency on ajtcl to alljoyn-tcl

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
