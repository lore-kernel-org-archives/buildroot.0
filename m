From: John Stile <john@stilen.com>
Date: Fri, 01 Mar 2013 10:37:52 -0800
Subject: [Buildroot] adding dhcpcd
Message-ID: <1362163072.19802.25.camel@genx.eng.msli.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have a need for an RFC2131 compliant DHCP client, which dhcpcd
advertises to be (specifically  it needs to detect if a dhcp server
becomes available).

I am using buildroot-2011.11.

I tried to add my own package to buildroot, to build dhcpcd, but I have
no idea how to go about integrating into the system.

I configure static vs. dynamic via /etc/network/interfaces, but should I
do next?  

How does the default system decide what to do with networking?
What is the default dhcp client, and why isn't it RFC2131 compliant?
