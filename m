From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Jun 2016 17:01:12 +0200
Subject: [Buildroot] lirc event didn't forward
In-Reply-To: <CAG7w3ynQvczcSRsKMwABLTv+zRcURmbNHUJR=Sy2TCwOnMg-VQ@mail.gmail.com>
 (gdbabu Krishnan's message of "Tue, 7 Jun 2016 19:35:26 +0530")
References: <CAG7w3ynQvczcSRsKMwABLTv+zRcURmbNHUJR=Sy2TCwOnMg-VQ@mail.gmail.com>
Message-ID: <878tyhf3gn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "gdbabu" == gdbabu Krishnan <gdbabu.krishnan@gmail.com> writes:

 > Hi,
 > i am working with buildroot for raspberry pi, i have enable the LIRC-TOOL
 > in build root.

 > i did successfully build, when i working with "irw" command for LIRC
 > working fine,

 > then i enable "uinput= True" in "lirc_options.conf" file under the
 > "/etc/lirc/" directory after this step i have restart the "S25lircd" service

 > after that i gave "irw" and press button  on remote nothing happen.

 > LIRCD does not forward the event to the "uinput" driver.

Do you have uinput support in the kernel (E.G. do you have
/dev/uinput)?

I was going to say that you probably will have more luck asking about
lirc questions on the lirc list, but I've seen that you have already
done so.

-- 
Bye, Peter Korsgaard
