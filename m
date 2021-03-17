From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Mar 2021 20:09:01 +0100
Subject: [Buildroot] [PATCH 7/8] package/optee-test: add deps on openssl
 when enabled
In-Reply-To: <20210306231545.GY2275@scaer> (Yann E. MORIN's message of "Sun, 7
 Mar 2021 00:15:45 +0100")
References: <20201030075045.6960-1-etienne.carriere@linaro.org>
 <20201030075045.6960-7-etienne.carriere@linaro.org>
 <20210306231545.GY2275@scaer>
Message-ID: <87tup9wqb6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > ?tienne, All,
 > On 2020-10-30 08:50 +0100, Etienne Carriere spake thusly:
 >> Add a dependency on openssl upon BR2_PACKAGE_LIBOPENSSL=y to
 >> enable some for OP-TEE embedded tests.
 >> 
 >> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>

 > Applied to next, with the following changes:

 >   - match the depenency to libopenssl, since that's is what is used in
 >     the condition (BR2_PACKAGE_LIBOPENSSL)
 >   - add a blurb to explain why libopenssl is used, not the virutal
 >     openssl

Committed to 2021.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
