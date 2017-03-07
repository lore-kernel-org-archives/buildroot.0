From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Mar 2017 16:12:30 +0100
Subject: [Buildroot] [PATCH] wireshark: security bump to version 2.2.5
In-Reply-To: <20170306174649.02f1bf33@free-electrons.com> (Thomas Petazzoni's
 message of "Mon, 6 Mar 2017 17:46:49 +0100")
References: <20170306145527.4718-1-gustavo@zacarias.com.ar>
 <20170306174649.02f1bf33@free-electrons.com>
Message-ID: <87varlce8x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Mon,  6 Mar 2017 11:55:27 -0300, Gustavo Zacarias wrote:
 >> Fixes:
 >> wnpa-sec-2017-03 - LDSS dissector crash
 >> wnpa-sec-2017-04 - RTMTP dissector infinite loop
 >> wnpa-sec-2017-05 - WSP dissector infinite loop
 >> wnpa-sec-2017-06 - STANAG 4607 file parser infinite loop
 >> wnpa-sec-2017-07 - NetScaler file parser infinite loop
 >> wnpa-sec-2017-08 - NetScaler file parser crash
 >> wnpa-sec-2017-09 - K12 file parser crash
 >> wnpa-sec-2017-10 - IAX2 dissector infinite loop
 >> wnpa-sec-2017-11 - NetScaler file parser infinite loop
 >> 
 >> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 >> ---
 >> package/wireshark/wireshark.hash | 4 ++--
 >> package/wireshark/wireshark.mk   | 2 +-
 >> 2 files changed, 3 insertions(+), 3 deletions(-)

 > Applied to master, thanks. Peter: we want this one for LTS I guess.

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
