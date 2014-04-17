From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 17 Apr 2014 22:15:05 +0200
Subject: [Buildroot] Analysis of build failures, help requested!
In-Reply-To: <20140417213939.35afc5ff@skate>
References: <20140417063009.B2279100D24@stock.ovh.net>
 <20140417213939.35afc5ff@skate>
Message-ID: <53503649.1020803@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> 
>>        arm |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/a88e2af7cd1ece12213da52c8dd687f8d6813299/
> 
> Python problem, to be investigated by Samuel.
> 

This problem is fixed in the 2.4.1 release:
https://bugs.lttng.org/projects/lttng-ust/repository/revisions/dcb6ba251f8c612133e4a3e064690d915f54a146

python (optional) dependency is missing in the package since it's needed for lttng-gen-tp and ptime tools.

Samuel, what do you think about updating lttng to 2.4.1 version ?

Best regards,
Romain Naour
