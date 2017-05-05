From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 May 2017 14:32:37 +0200
Subject: [Buildroot] [PATCH 1/4] bluez5_utils: allow install of
	deprecated tools
In-Reply-To: <a98f6fda9cded4f8416b2a6f2249e85be944eca4.1493643541.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 1 May 2017 15:59:41 +0300")
References: <cover.1493643541.git.baruch@tkos.co.il>
 <a98f6fda9cded4f8416b2a6f2249e85be944eca4.1493643541.git.baruch@tkos.co.il>
Message-ID: <87h90ztrfe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Since BlueZ 5.44 many command line tools are deprecated, among them
 > gatttool. Add an option to install these tools.

 > Remove the gatttool specific option, since it is redundant now.

 > Fixes:
 > http://autobuild.buildroot.net/results/ddb/ddb975c9e1475fee1da63cb21240d8d59b161076/
 > http://autobuild.buildroot.net/results/19a/19adc0aa5a7e48119ef4ba25ba0403867f74f678/
 > http://autobuild.buildroot.net/results/9bd/9bd8e13ddffdd0631ddca30ec40cc4664729b0cb/

 > Cc: Marcin Bis <marcin@bis.org.pl>
 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
