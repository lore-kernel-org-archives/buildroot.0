From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Dec 2020 11:41:24 +0100
Subject: [Buildroot] [PATCH] package/go: fix a typo in CC and CXX env
 values
In-Reply-To: <8selkOZpKE5CREY0ZZ4DfQgdVGdikFT69Rfm3Jo05uQO5vUDo-KlPp3AZiao5Qiwu03f-XUFHGg6uuYrhxGJYLk_9KqwZcQbj2O2ue5jaAc=@baudi.no>
 (Michael Baudino's message of "Fri, 18 Dec 2020 09:57:42 +0000")
References: <8selkOZpKE5CREY0ZZ4DfQgdVGdikFT69Rfm3Jo05uQO5vUDo-KlPp3AZiao5Qiwu03f-XUFHGg6uuYrhxGJYLk_9KqwZcQbj2O2ue5jaAc=@baudi.no>
Message-ID: <875z4um8bv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Baudino <michael@baudi.no> writes:

 > This commit fixes a typo in variable names that caused CC and CXX
 > environment variables to be empty.

 > Signed-off-by: Michael Baudino <michael@baudi.no>

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
