From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Oct 2018 12:02:42 +0200
Subject: [Buildroot] Update the current date using ntp.
In-Reply-To: <CALtfCQa-jdUYs+nN5weRwzLTe3-MX+U7ENDCPS0f4HkjJ38Dxw@mail.gmail.com>
 (Oscar Gomez Fuente's message of "Tue, 16 Oct 2018 10:41:37 +0200")
References: <CALtfCQaov7R68HfvZtNOse+SGu9Y8vihS=4xgixjtjE__VXkkQ@mail.gmail.com>
 <CANQCQpZA_Xgjx+pKvZXp97VYvwk4M0M=PhaEUQQqu40QjV4_iQ@mail.gmail.com>
 <4f85764f-4677-56bb-01f0-46def72c3d9b@mind.be>
 <871s8qo41u.fsf@dell.be.48ers.dk>
 <CALtfCQa-jdUYs+nN5weRwzLTe3-MX+U7ENDCPS0f4HkjJ38Dxw@mail.gmail.com>
Message-ID: <87woqimcot.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Oscar" == Oscar Gomez Fuente <oscargomezf@gmail.com> writes:

 > Hi everyone,
 > I was trying on chrony (version 3.4) on my Raspberry Pi 3b+ but it
 > seems to be that it fails wit this message:

 > Could not open configuration file /etc/chrony.conf : No such file or directory

 > I think that it has to be added a chrony.conf default file in
 > ../package/chrony and it has to installed in /etc.

Well, the question is what should the default configuration be exactly?
We have a lot of packages that do not provide any default configuration.

-- 
Bye, Peter Korsgaard
