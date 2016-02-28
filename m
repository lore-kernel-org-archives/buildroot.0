From: Roland Franke <fli4l@franke-prem.de>
Date: Sun, 28 Feb 2016 20:22:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/libfuse: fix internal version
	number
In-Reply-To: <87twkspvzx.fsf@dell.be.48ers.dk>
References: <1456668330-14361-1-git-send-email-bernd.kuhls@t-online.de>
 <87twkspvzx.fsf@dell.be.48ers.dk>
Message-ID: <DE460A1C536D48268A62487407ABE68C@ROLANDAMD64>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

>> Upstream forgot to bump the internal version number to 2.9.5 during the
>> last update. Roland Franke sent me an e-mail about it before posting
>> to the buildroot mailinglist, in order to help the integration of this
>> patch into buildroot I am sending this patch formatted by git.

> What is the practical impact of this? Is it purely cosmetical?

In the system (fli4l) we have fix filenames inside the system.
So how can we differ without correct filenames?
How should we know if there is the real version 2.9.4 or the version
2.9.5 will be used?
How should be known if changes between version 2.9.4 and 2.9.5
realy be installed?

So the result is more cosmetical for most users. But in situations you 
have more versions available for download, you should be sure to have 
an right version-number.

--
Bye, Roland Franke
