From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 08 Mar 2020 21:06:02 +0100
Subject: [Buildroot] [PATCH 2/4] package/optee-test: use python3 instead
 of python
In-Reply-To: <20200308183535.1206604-2-romain.naour@smile.fr> (Romain Naour's
 message of "Sun, 8 Mar 2020 19:35:33 +0100")
References: <20200308183535.1206604-1-romain.naour@smile.fr>
 <20200308183535.1206604-2-romain.naour@smile.fr>
Message-ID: <87lfoasjbp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > Fixes:
 > TypeError: cannot use a str to initialize an array with typecode 'B'
 >   File "../../scripts/file_to_c.py", line 32, in main
 >     for x in array.array("B", inf.read()):
 >     for x in array.array("B", inf.read()):
 > TypeError: cannot use a str to initialize an array with typecode 'B'
 > TypeError: cannot use a str to initialize an array with typecode 'B'

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>

Reworded the commit message a bit and committed, thanks.

-- 
Bye, Peter Korsgaard
