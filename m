From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 29 Feb 2012 17:01:20 +0100
Subject: [Buildroot] Buildroot 2012.02-rc3 released
In-Reply-To: <CAJJ6jxtawrULPdNUykruT4azk68_ZgFMRf6UwDJNH0D=AckBJQ@mail.gmail.com>
 (Steve Calfee's message of "Wed, 29 Feb 2012 07:54:10 -0800")
References: <87ehtg2r6n.fsf@macbook.be.48ers.dk> <4F4D2A90.1050309@gmail.com>
 <877gz6drz9.fsf@macbook.be.48ers.dk>
 <CAJJ6jxtawrULPdNUykruT4azk68_ZgFMRf6UwDJNH0D=AckBJQ@mail.gmail.com>
Message-ID: <87hay9d3xr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Steve" == Steve Calfee <stevecalfee@gmail.com> writes:

Hi,

 Steve> Hi Peter,

 Steve> Still a problem from two laptops, and from two locations. Work, i
 Steve> don't know who the isp is, but at home I am on ATT's uverse:

 Steve> me:~$ host -a git.buildroot.net
 Steve> Trying "git.buildroot.net"
 Steve> ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 65055
 Steve> ;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0

 Steve> ;; QUESTION SECTION:
 Steve> ;git.buildroot.net.		IN	ANY

 Steve> ;; ANSWER SECTION:
 Steve> git.buildroot.net.	43200	IN	CNAME	buildroot.uclibc.org.

And what about host -a buildroot.uclibc.org? It should resolve to
140.211.167.224 (it's a CNAME for www.uclibc.org).

 Steve> Received 69 bytes from 192.168.0.1#53 in 126 ms
 Steve> me:~$ wget 'http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.02_rc3'
 Steve> --2012-02-29 07:47:04--
 Steve> http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.02_rc3
 Steve> Resolving git.buildroot.net... failed: Name or service not known.
 Steve> wget: unable to resolve host address `git.buildroot.net'

 Steve> Regards, Steve


-- 
Bye, Peter Korsgaard
