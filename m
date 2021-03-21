From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Mar 2021 19:55:35 +0100
Subject: [Buildroot] [PATCH v2,
 2/2] package/sconeserver: pcre is optional, not mandatory
In-Reply-To: <20210303181228.1079557-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 3 Mar 2021 19:12:28 +0100")
References: <20210303181228.1079557-1-fontaine.fabrice@gmail.com>
 <20210303181228.1079557-2-fontaine.fabrice@gmail.com>
Message-ID: <875z1kqqu0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > pcre is optional not mandatory since
 > https://github.com/sconemad/sconeserver/commit/98ec61436c9ea68ffe2d70a818c1175dcafa2a79

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Peter Seiderer):
 >  - Drop select from Config.in

Committed to 2020.02.x, 2020.11.x and 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
