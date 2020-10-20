From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Oct 2020 13:53:23 +0200
Subject: [Buildroot] OpenSSL & Mosquitto on ARM Cortex M7
In-Reply-To: <01b901d6a5ad$95b9df00$c12d9d00$@gmail.com> (rob's message of
 "Mon, 19 Oct 2020 02:20:00 +0200")
References: <01b901d6a5ad$95b9df00$c12d9d00$@gmail.com>
Message-ID: <87tuupjeq4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>>   <rob.r374@gmail.com> writes:

 > Hello,
 > I'm trying to include Mosquitto with OpenSSL support on Buildroot. 

 

 > On working Buildroot basic build, I've added packages and setup static libs
 > :

 > BR2_PACKAGE_LIBOPENSSL=y

 > BR2_PACKAGE_MOSQUITTO=y 

 > BR2_PACKAGE_MBEDTLS=y

Why both mbedtls and openssl?

 > BR2_STATIC_LIBS=y

 > If I try to run Mosquitto tools (and MbedTLS test), I get :

 > ~ # mosquitto_pub

 > binfmt_flat: reference 0xffb4d0 to shared library 127, killing
 > mosquitto_pub!

binfmt_flat? What architecture are you building for / what is your
entire defconfig?

-- 
Bye, Peter Korsgaard
