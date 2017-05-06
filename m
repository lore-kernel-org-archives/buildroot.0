From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 06 May 2017 10:53:18 +0200
Subject: [Buildroot] [PATCH v1] poppler: add missing std::vector include
	for Qt code
In-Reply-To: <20170505211759.1389-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Fri, 5 May 2017 23:17:59 +0200")
References: <20170505211759.1389-1-ps.report@gmx.net>
Message-ID: <87shkiqsch.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Fixes [1], [2]:
 >   ../../poppler/Form.h:544:14: error: ?vector? in namespace ?std? does not name a template type
 >      const std::vector<Ref> &getCalculateOrder() const { return calculateOrder; }

 >   ../../poppler/Form.h:556:8: error: ?vector? in namespace ?std? does not name a template type
 >      std::vector<Ref> calculateOrder;

 > [1] http://autobuild.buildroot.net/results/b749b252f63945f278358dcd76b6e9c55214ccd8
 > [2] http://autobuild.buildroot.net/results/92e68defe746eb4852b3a45bb27af2282d3f4c7e

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed, thanks. Don't forget to send the patch upstream.

-- 
Bye, Peter Korsgaard
