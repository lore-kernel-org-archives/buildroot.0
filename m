From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Feb 2019 20:55:48 +0100
Subject: [Buildroot] [PATCH] package/pugixml: force-enable 'long long'
 support to support gcc<4.8
In-Reply-To: <20190205142826.18285-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Tue, 5 Feb 2019 15:28:26 +0100")
References: <20190205142826.18285-1-patrickdepinguin@gmail.com>
Message-ID: <87sgx2j9h7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > Although pugixml will enable 'long long' support automatically if it detects
 > C++11 (gcc 4.8+), we would like to support older gcc compilers too.

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

4.8 is really old, but OK.

Committed, thanks.

-- 
Bye, Peter Korsgaard
