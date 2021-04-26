From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 15:20:07 +0200
Subject: [Buildroot] [PATCH 01/25] package/automake: add _CPE_ID_VENDOR
In-Reply-To: <20210420213208.GL298901@scaer> (Yann E. MORIN's message of "Tue, 
 20 Apr 2021 23:32:08 +0200")
References: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
 <20210420213208.GL298901@scaer>
Message-ID: <875z09kws8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Matthew, All,
 > On 2021-04-20 15:11 -0500, Matt Weber spake thusly:
 >> cpe:2.3:a:gnu:automake:* is a valid CPE identifier for this package:
 >> 
 >> https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Aautomake
 >> 
 >> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

 > In this series of 25, I've applied all patches, except the libqmi one,
 > which is missing your SoB line.

 > Otherwise, I did a few changes here and there;

 >   - for the two python3 packages, I've added short hashes for the
 >     correspnding commits for the python(2) variants

 >   - in a few patches, I've moved the definitions right fter the license

 >   - I've updated the libtool commit as per your feedback

 > Thanks!

Committed the same 24 patches to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
