From: Malenboim Vadim <vadim.malenboim@elbitsystems.com>
Date: Tue, 9 Mar 2010 09:33:31 +0200
Subject: [Buildroot] buildroot with X fails
Message-ID: <9D45D516A3A4E749A9383327E66FF7240DD333@mailesl5.esl.corp.elbit.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
I've successfully compiled buildroot with X when the target architecture
was selected as i386.
Now I tried to do the same with a clean build but for x86_64 it's my
real target board ATOM SOM7562,
But it failed with the following error :

checking for GL... configure: error: Package requirements (glproto >=
1.4.9 gl >= 7.1.0) were not met:

No package 'gl' found

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.

Alternatively, you may set the environment variables GL_CFLAGS
and GL_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.


Again this error didn't appear with the i386 build.
I'm building on a ubuntu 2.16.31-19-generic x86_64

Any guldens would be appreciated .

Thanks in advance.

Vadim Malenboim
Embedded Software Eng.
Elbit Land Systems & C4I - Tadiran. 
Office   :972-4-8315075
Mobile  :972-4-4925862
Fax      :972-4-8315657




The information in this e-mail transmission contains proprietary and business 
sensitive information.  Unauthorized interception of this e-mail may constitute 
a violation of law. If you are not the intended recipient, you are hereby 
notified that any review, dissemination, distribution or duplication of this 
communication is strictly prohibited. You are also asked to contact the sender 
by reply email and immediately destroy all copies of the original message.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100309/5c8e4dc4/attachment.htm>
