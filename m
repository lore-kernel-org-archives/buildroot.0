From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Feb 2020 14:49:28 +0100
Subject: [Buildroot] Buildroot 2020.02-rc1 released
In-Reply-To: <CAKpO6uFXLdPAmmSqWvsNLpXDUuVSoF9Jaoro0yq5PxitYyJnww@mail.gmail.com>
 (Mircea Gliga's message of "Wed, 19 Feb 2020 15:17:21 +0200")
References: <87zhded8wf.fsf@dell.be.48ers.dk>
 <CAKpO6uFXLdPAmmSqWvsNLpXDUuVSoF9Jaoro0yq5PxitYyJnww@mail.gmail.com>
Message-ID: <87v9o2d6vr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mircea" == Mircea Gliga <gliga.mircea@gmail.com> writes:

 > Hi Peter
 > There seems to be a problem with the download link, I get a 404 return code:

 > Br,
 > Mircea

 > wget https://buildroot.org/downloads/buildroot-2020.02-rc1.tar.gz
 > --2020-02-19 15:14:50--
 > https://buildroot.org/downloads/buildroot-2020.02-rc1.tar.gz
 > Loaded CA certificate '/etc/ssl/certs/ca-certificates.crt'
 > Resolving buildroot.org (buildroot.org)... 140.211.167.122
 > Connecting to buildroot.org (buildroot.org)|140.211.167.122|:443...
 > connected.
 > HTTP request sent, awaiting response... 404 Not Found
 > 2020-02-19 15:14:51 ERROR 404: Not Found.

Ups, should be fixed now.

-- 
Bye, Peter Korsgaard
