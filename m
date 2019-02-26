From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 Feb 2019 14:52:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/ibrcommon: fix static build
 with openssl
In-Reply-To: <CAPi7W8152uxi=E=rTZbGKFgKFeTGovay_O+zuYrmmux7+8w5sA@mail.gmail.com>
 (Fabrice Fontaine's message of "Tue, 26 Feb 2019 13:32:45 +0100")
References: <20190216112319.4769-1-fontaine.fabrice@gmail.com>
 <87a7ikg7ey.fsf@dell.be.48ers.dk>
 <CAPi7W8152uxi=E=rTZbGKFgKFeTGovay_O+zuYrmmux7+8w5sA@mail.gmail.com>
Message-ID: <87o96yd5dl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

Hi,
 >> The DOS newlines unfortunately got stripped by the mailing list, so the
 >> patch no longer applies. I have manually fixed that up now.

 > Thanks for fixing the issue, there is also the same problem with
 > host-cryptopp's patch:
 > http://autobuild.buildroot.net/results/e8f/e8fad6fe97391276df0bbb3deb9d4ab90ce043d1/build-end.log.
 > Could you also fix the issue?
 > Next time, I'll try to add a warning in the commit message.

Sure, fixed. It would indeed be good if you could give a small heads up
in case we have such issue again in the future.

-- 
Bye, Peter Korsgaard
