From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Apr 2018 12:19:56 +0200
Subject: [Buildroot] Buildroot 2018.02 Mosquitto v1.4.15 : no
 CONNECT/CONNACK on libmosquitto
In-Reply-To: <20180327210232.4692d68a@windsurf.home> (Thomas Petazzoni's
 message of "Tue, 27 Mar 2018 21:02:32 +0200")
References: <CALmdmcBazaBmEVUiCL3N6kCV4AgSp2Duqv2=iPzy1uUSTyCYyQ@mail.gmail.com>
 <20180327210232.4692d68a@windsurf.home>
Message-ID: <87po3hoqpf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 >> Before diving more in depth in this issue on mosquitto code, I would like
 >> to ask here : is there anyone encountering the same issue with this new
 >> mosquitto version ? I did not see any comment about this in the mailing
 >> list, but maybe the release is too young so it has not been detected yet ?
 >> Or anyone can confirm that this new version, used as client with C API,
 >> works on its side ?

 > Did you try reverting commit f4df4a18e5dd4702f842e61ee815f13afd93c366,
 > to bring back mosquitto to the 1.4.14 version ?

Did that solve your problem?

-- 
Bye, Peter Korsgaard
