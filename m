From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Nov 2020 23:22:48 +0100
Subject: [Buildroot] [PATCH v2, 1/1] package/openvpn: add mbedtls support
In-Reply-To: <20201029173556.506699-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 29 Oct 2020 18:35:56 +0100")
References: <20201029173556.506699-1-fontaine.fabrice@gmail.com>
Message-ID: <87o8ke3wsn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > mbedtls (former polarssl) support was dropped with commit
 > 3380da69c5ab490e5c51dca0c4389b0da91743d0

 > Put it back as openvpn supports mbedtls 2.x since version 2.4.0 and
 > https://github.com/OpenVPN/openvpn/commit/86d8cd6860dfc74cb1a040ff8fe03140ebe7f930

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2:
 >  - Remove openssl from openvpn mandatory dependencies

Committed, thanks.

-- 
Bye, Peter Korsgaard
