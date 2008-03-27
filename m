From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 27 Mar 2008 12:13:24 +0100
Subject: [Buildroot] Build root fails
In-Reply-To: <dcf6addc0803261837t7b48b1c9ge8bfa749995abae9@mail.gmail.com>
References: <dcf6addc0803260227r6d2e458fr242e9a529ec8a8b8@mail.gmail.com>
	<dcf6addc0803260232m74584c1cpf1f057f1dba3466@mail.gmail.com>
	<20080326120221.GA29267@mx.loc>
	<dcf6addc0803261837t7b48b1c9ge8bfa749995abae9@mail.gmail.com>
Message-ID: <20080327111324.GA13379@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 27, 2008 at 09:37:01AM +0800, Jun Ma wrote:
>On Wed, Mar 26, 2008 at 8:02 PM, Bernhard Fischer <rep.dot.nop@gmail.com> wrote:
>
>> >#
>> ># Automatically generated make config: don't edit
>> ># Tue Feb 17 01:24:25 2015
>> []
>> >#
>> ># Atmel Mirrors
>> >#
>> >BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot/"
>> >BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
>>
>> This is not my repo, so better git clone
>>
>
>I am confused, the buildroot source was dowloaded from
>http://buildroot.uclibc.org/downloads/snapshots/,
>seems the officially release is based on svn, not
>git('http://repo.or.cz/w/buildroot.git').

yes, exactly. To recap, you asked:
"here is a link with the same problems reported:
http://www.busybox.net/lists/buildroot/2008-January/006754.html
Should I need git clone that tree, or waiting for this svn update?
:)
"

Currently, i will not pull packages/* from svn since i already cleaned
up the most commonly used packages and do not have a need for the rest,
so don't hold your breath.
